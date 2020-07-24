export rootfs=$rootfs2
configure()
{
    echo "- 正在设置 hostname ... "
    echo 'localhost' > "$rootfs2/etc/hostname"
    echo "- 正在设置 DNS ... "
    if ! $(grep -q "^127.0.0.1" "$rootfs2/etc/hosts"); then
        echo '127.0.0.1 localhost' >> "$rootfs2/etc/hosts"
    fi
[ -n "${LOCALE}" ] || LOCALE="${LANG}"
[ -n "${LOCALE}" ] || LOCALE="C"
    echo "- 正在设置 locale ... "
    if $(echo ${LOCALE} | grep -q '\.'); then
        local inputfile=$(echo ${LOCALE} | awk -F. '{print $1}')
        local charmapfile=$(echo ${LOCALE} | awk -F. '{print $2}')
        export cmd2="localedef -i ${inputfile} -c -f ${charmapfile} ${LOCALE}"
        exec_auto
        unset cmd2
    fi
    echo "- 正在配置 su ... "
    local item pam_su
    for item in /etc/pam.d/su /etc/pam.d/su-l
    do
        pam_su="$rootfs2/${item}"
        if [ -e "${pam_su}" ]; then
            if ! $(grep -q '^auth.*sufficient.*pam_succeed_if.so uid = 0 use_uid quiet$' "${pam_su}"); then
                sed -i '1,/^auth/s/^\(auth.*\)$/auth\tsufficient\tpam_succeed_if.so uid = 0 use_uid quiet\n\1/' "${pam_su}"
            fi
        fi
    done
    echo "- 正在配置 timezone ... "
    local timezone
    if [ -n "$(which getprop)" ]; then
        timezone=$(getprop persist.sys.timezone)
    elif [ -e "/etc/timezone" ]; then
        timezone=$(cat /etc/timezone)
    fi
    if [ -n "${timezone}" ]; then
        rm -f "$rootfs2/etc/localtime"
        cp "$rootfs2/usr/share/zoneinfo/${timezone}" "$rootfs2/etc/localtime"
        echo ${timezone} > "$rootfs2/etc/timezone"
    fi
[ -n "${USER_NAME}" ] || USER_NAME="root"
[ -n "${USER_PASSWORD}" ] || USER_PASSWORD="changeme"
    echo "- 正在配置 profile ... "
    if [ -z "${USER_NAME%aid_*}" ]; then
        echo "Username \"${USER_NAME}\" is reserved."; return 1
    fi
    # user profile
    if [ "${USER_NAME}" != "root" ]; then
    export cmd2=groupadd ${USER_NAME} && useradd -m -g ${USER_NAME} -s /bin/sh ${USER_NAME} && usermod -g ${USER_NAME} ${USER_NAME}
    exec_auto
    unset cmd2
    fi
    # set password for user
    export cmd2=chpasswd
    echo ${USER_NAME}:${USER_PASSWORD} | exec_auto
    unset cmd2
    # set permissions
    export cmd2=chown -R ${USER_NAME}:${USER_NAME} "$(user_home ${USER_NAME})"
    exec_auto
    unset cmd2
    echo "- 正在配置 sudo ... "
    local sudo_str="${USER_NAME} ALL=(ALL:ALL) NOPASSWD:ALL"
    if ! grep -q "${sudo_str}" "$rootfs2/etc/sudoers"; then
        chmod 640 "$rootfs2/etc/sudoers"
        echo ${sudo_str} >> "$rootfs2/etc/sudoers"
        chmod 440 "$rootfs2/etc/sudoers"
    fi
    if [ -e "$rootfs2/etc/profile.d" ]; then
        echo '[ -n "$PS1" -a "$(whoami)" = "'${USER_NAME}'" ] || return 0' > "$rootfs2/etc/profile.d/sudo.sh"
        echo 'alias su="sudo su"' >> "$rootfs2/etc/profile.d/sudo.sh"
    fi
    echo "- 正在设置 aid ... "
    # set min uid and gid
    local login_defs
    login_defs="$rootfs2/etc/login.defs"
    if [ ! -e "${login_defs}" ]; then
        touch "${login_defs}"
    fi
    if ! $(grep -q '^ *UID_MIN' "${login_defs}"); then
        echo "UID_MIN 5000" >>"${login_defs}"
        sed -i 's|^[#]\?UID_MIN.*|UID_MIN 5000|' "${login_defs}"
    fi
    if ! $(grep -q '^ *GID_MIN' "${login_defs}"); then
        echo "GID_MIN 5000" >>"${login_defs}"
        sed -i 's|^[#]\?GID_MIN.*|GID_MIN 5000|' "${login_defs}"
    fi
    # Add Android Group
        local aid
        for aid in $(cat "$TOOLKIT/android_groups")
        do
            local xname=$(echo ${aid} | awk -F: '{print $1}')
            local xid=$(echo ${aid} | awk -F: '{print $2}')
            sed -i "s|^${xname}:.*|${xname}:x:${xid}:|" "$rootfs2/etc/group"
            if ! $(grep -q "^${xname}:" "$rootfs2/etc/group"); then
                echo "${xname}:x:${xid}:" >> "$rootfs2/etc/group"
            fi
            if ! $(grep -q "^${xname}:" "$rootfs2/etc/passwd"); then
                echo "${xname}:x:${xid}:${xid}::/:/bin/false" >> "$rootfs2/etc/passwd"
            fi
        done
        local usr
        for usr in ${PRIVILEGED_USERS}
        do
            local uid=${usr%%:*}
            local gid=${usr##*:}
            sed -i "s|^\(${gid}:.*:[^:]+\)$|\1,${uid}|" "$rootfs2/etc/group"
            sed -i "s|^\(${gid}:.*:\)$|\1${uid}|" "$rootfs2/etc/group"
        done
}
$@