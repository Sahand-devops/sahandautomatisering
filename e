> ANSIBLE.BUILTIN.YUM    (/usr/lib/python3/dist-packages/ansible/modules/yum.py)

        Installs, upgrade, downgrades, removes, and lists packages and groups with the `yum' package
        manager. This module only works on Python 2. If you require Python 3 support see the
        [ansible.builtin.dnf] module.

ADDED IN: historical

  * note: This module has a corresponding action plugin.

OPTIONS (= is mandatory):

- allow_downgrade
        Specify if the named package and version is allowed to downgrade a maybe already installed higher
        version of that package. Note that setting allow_downgrade=True can make this module behave in a
        non-idempotent way. The task could end up with a set of packages that does not match the complete
        list of specified packages to install (because dependencies between the downgraded package and
        others can cause changes to the packages which were in the earlier transaction).
        default: 'no'
        type: bool
        added in: version 2.4 of ansible-core


- autoremove
        If `true', removes all "leaf" packages from the system that were originally installed as
        dependencies of user-installed packages but which are no longer required by any such package. Should
        be used alone or when `state' is `absent'
        NOTE: This feature requires yum >= 3.4.3 (RHEL/CentOS 7+)
        default: 'no'
        type: bool
        added in: version 2.7 of ansible-core


- bugfix
        If set to `true', and `state=latest' then only installs updates that have been marked bugfix
        related.
        default: 'no'
        type: bool
        added in: version 2.6 of ansible-core


- cacheonly
        Tells yum to run entirely from system cache; does not download or update metadata.
        default: 'no'
        type: bool
        added in: version 2.12 of ansible-core


- conf_file
        The remote yum configuration file to use for the transaction.
        default: null
        type: str
        added in: version 0.6 of ansible-core


- disable_excludes
        Disable the excludes defined in YUM config files.
        If set to `all', disables all excludes.
        If set to `main', disable excludes defined in [main] in yum.conf.
        If set to `repoid', disable excludes defined for given repo id.
        default: null
        type: str
        added in: version 2.7 of ansible-core


- disable_gpg_check
        Whether to disable the GPG checking of signatures of packages being installed. Has an effect only if
        `state' is `present' or `latest'.
        default: 'no'
        type: bool
        added in: version 1.2 of ansible-core


- disable_plugin
        `Plugin' name to disable for the install/update operation. The disabled plugins will not persist
        beyond the transaction.
        default: []
        elements: str
        type: list
        added in: version 2.5 of ansible-core


- disablerepo
        `Repoid' of repositories to disable for the install/update operation. These repos will not persist
        beyond the transaction. When specifying multiple repos, separate them with a `","'.
        As of Ansible 2.7, this can alternatively be a list instead of `","' separated string
        default: []
        elements: str
        type: list
        added in: version 0.9 of ansible-core


- download_dir
        Specifies an alternate directory to store packages.
        Has an effect only if `download_only' is specified.
        default: null
        type: str
        added in: version 2.8 of ansible-core


- download_only
        Only download the packages, do not install them.
        default: 'no'
        type: bool
        added in: version 2.7 of ansible-core


- enable_plugin
        `Plugin' name to enable for the install/update operation. The enabled plugin will not persist beyond
        the transaction.
        default: []
        elements: str
        type: list
        added in: version 2.5 of ansible-core


- enablerepo
        `Repoid' of repositories to enable for the install/update operation. These repos will not persist
        beyond the transaction. When specifying multiple repos, separate them with a `","'.
        As of Ansible 2.7, this can alternatively be a list instead of `","' separated string
        default: []
        elements: str
        type: list
        added in: version 0.9 of ansible-core


- exclude
        Package name(s) to exclude when state=present, or latest
        default: []
        elements: str
        type: list
        added in: version 2.0 of ansible-core


- install_repoquery
        If repoquery is not available, install yum-utils. If the system is registered to RHN or an RHN
        Satellite, repoquery allows for querying all channels assigned to the system. It is also required to
        use the 'list' parameter.
        NOTE: This will run and be logged as a separate yum transation which takes place before any other
        installation or removal.
        NOTE: This will use the system's default enabled repositories without regard for
        disablerepo/enablerepo given to the module.
        default: 'yes'
        type: bool
        added in: version 1.5 of ansible-core


- install_weak_deps
        Will also install all packages linked by a weak dependency relation.
        NOTE: This feature requires yum >= 4 (RHEL/CentOS 8+)
        default: 'yes'
        type: bool
        added in: version 2.8 of ansible-core


- installroot
        Specifies an alternative installroot, relative to which all packages will be installed.
        default: /
        type: str
        added in: version 2.3 of ansible-core


- list
        Package name to run the equivalent of `yum list --show-duplicates <package>' against. In addition to
        listing packages, use can also list the following: `installed', `updates', `available' and `repos'.
        This parameter is mutually exclusive with `name'.
        default: null
        type: str

- lock_timeout
        Amount of time to wait for the yum lockfile to be freed.
        default: 30
        type: int
        added in: version 2.8 of ansible-core


- name
        A package name or package specifier with version, like `name-1.0'.
        Comparison operators for package version are valid here `>', `<', `>=', `<='. Example - `name>=1.0'
        If a previous version is specified, the task also needs to turn `allow_downgrade' on. See the
        `allow_downgrade' documentation for caveats with downgrading packages.
        When using `state=latest', this can be `'*'' which means run `yum -y update'.
        You can also pass a url or a local path to an rpm file (using `state=present'). To operate on
        several packages this can accept a comma separated string of packages or (as of 2.0) a list of
        packages.
        aliases: [pkg]
        default: []
        elements: str
        type: list

- releasever
        Specifies an alternative release from which all packages will be installed.
        default: null
        type: str
        added in: version 2.7 of ansible-core


- security
        If set to `true', and `state=latest' then only installs updates that have been marked security
        related.
        default: 'no'
        type: bool
        added in: version 2.4 of ansible-core


- skip_broken
        Skip all unavailable packages or packages with broken dependencies without raising an error.
        Equivalent to passing the --skip-broken option.
        default: 'no'
        type: bool
        added in: version 2.3 of ansible-core


- sslverify
        Disables SSL validation of the repository server for this transaction.
        This should be set to `false' if one of the configured repositories is using an untrusted or self-
        signed certificate.
        default: 'yes'
        type: bool
        added in: version 2.13 of ansible-core


- state
        Whether to install (`present' or `installed', `latest'), or remove (`absent' or `removed') a
        package.
        `present' and `installed' will simply ensure that a desired package is installed.
        `latest' will update the specified package if it's not of the latest available version.
        `absent' and `removed' will remove the specified package.
        Default is `None', however in effect the default action is `present' unless the `autoremove' option
        is enabled for this module, then `absent' is inferred.
        choices: [absent, installed, latest, present, removed]
        default: null
        type: str

- update_cache
        Force yum to check if cache is out of date and redownload if needed. Has an effect only if `state'
        is `present' or `latest'.
        aliases: [expire-cache]
        default: 'no'
        type: bool
        added in: version 1.9 of ansible-core


- update_only
        When using latest, only update installed packages. Do not install packages.
        Has an effect only if `state' is `latest'
        default: 'no'
        type: bool
        added in: version 2.5 of ansible-core


- use_backend
        This module supports `yum' (as it always has), this is known as `yum3'/`YUM3'/`yum-deprecated' by
        upstream yum developers. As of Ansible 2.7+, this module also supports `YUM4', which is the "new
        yum" and it has an `dnf' backend. As of ansible-core 2.15+, this module will auto select the backend
        based on the `ansible_pkg_mgr' fact.
        By default, this module will select the backend based on the `ansible_pkg_mgr' fact.
        choices: [auto, yum, yum4, dnf, dnf4, dnf5]
        default: auto
        type: str
        added in: version 2.7 of ansible-core


- validate_certs
        This only applies if using a https url as the source of the rpm. e.g. for localinstall. If set to
        `false', the SSL certificates will not be validated.
        This should only set to `false' used on personally controlled sites using self-signed certificates
        as it avoids verifying the source site.
        Prior to 2.1 the code worked as if this was set to `true'.
        default: 'yes'
        type: bool
        added in: version 2.1 of ansible-core



ATTRIBUTES:

        action:
          description: Indicates this has a corresponding action plugin so some parts of the
            options can be executed on the controller
          details: In the case of yum, it has 2 action plugins that use it under the hood,
            [ansible.builtin.yum] and [ansible.builtin.package].
          support: partial
        async:
          description: Supports being used with the `async' keyword
          support: none
        bypass_host_loop:
          description:
          - Forces a 'global' task that does not execute per host, this bypasses per host
            templating and serial, throttle and other loop considerations
          - Conditionals will work as if `run_once' is being used, variables used will be
            from the first available host
          - This action will not work normally outside of lockstep strategies
          support: none
        check_mode:
          description: Can run in check_mode and return changed status prediction without
            modifying target
          support: full
        diff_mode:
          description: Will return details on what has changed (or possibly needs changing
            in check_mode), when in diff mode
          support: full
        platform:
          description: Target OS/families that can be operated against
          platforms: rhel
          support: N/A

NOTES:
      * When used with a `loop:' each package will be processed individually, it is much more
        efficient to pass the list directly to the `name' option.
      * In versions prior to 1.9.2 this module installed and removed each package given to the yum
        module separately. This caused problems when packages specified by filename or url had to be
        installed or removed together. In 1.9.2 this was fixed so that packages are installed in one
        yum transaction. However, if one of the packages adds a new yum repository that the other
        packages come from (such as epel-release) then that package needs to be installed in a
        separate task. This mimics yum's command line behaviour.
      * Yum itself has two types of groups.  "Package groups" are specified in the rpm itself while
        "environment groups" are specified in a separate file (usually by the distribution).
        Unfortunately, this division becomes apparent to ansible users because ansible needs to
        operate on the group of packages in a single transaction and yum requires groups to be
        specified in different ways when used in that way.  Package groups are specified as
        "@development-tools" and environment groups are "@^gnome-desktop-environment". Use the "yum
        group list hidden ids" command to see which category of group the group you want to install
        falls into.
      * The yum module does not support clearing yum cache in an idempotent way, so it was decided not
        to implement it, the only method is to use command and call the yum command directly, namely
        "command: yum clean all" https://github.com/ansible/ansible/pull/31450#issuecomment-352889579


REQUIREMENTS:  yum

AUTHOR: Ansible Core Team, Seth Vidal (@skvidal), Eduard Snesarev (@verm666), Berend De Schouwer (@berenddeschouwer), Abhijeet Kasurde (@Akasurde), Adam Miller (@maxamillion)

EXAMPLES:

- name: Install the latest version of Apache
  ansible.builtin.yum:
    name: httpd
    state: latest

- name: Install Apache >= 2.4
  ansible.builtin.yum:
    name: httpd>=2.4
    state: present

- name: Install a list of packages (suitable replacement for 2.11 loop deprecation warning)
  ansible.builtin.yum:
    name:
      - nginx
      - postgresql
      - postgresql-server
    state: present

- name: Install a list of packages with a list variable
  ansible.builtin.yum:
    name: "{{ packages }}"
  vars:
    packages:
    - httpd
    - httpd-tools

- name: Remove the Apache package
  ansible.builtin.yum:
    name: httpd
    state: absent

- name: Install the latest version of Apache from the testing repo
  ansible.builtin.yum:
    name: httpd
    enablerepo: testing
    state: present

- name: Install one specific version of Apache
  ansible.builtin.yum:
    name: httpd-2.2.29-1.4.amzn1
    state: present

- name: Upgrade all packages
  ansible.builtin.yum:
    name: '*'
    state: latest

- name: Upgrade all packages, excluding kernel & foo related packages
  ansible.builtin.yum:
    name: '*'
    state: latest
    exclude: kernel*,foo*

- name: Install the nginx rpm from a remote repo
  ansible.builtin.yum:
    name: http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    state: present

- name: Install nginx rpm from a local file
  ansible.builtin.yum:
    name: /usr/local/src/nginx-release-centos-6-0.el6.ngx.noarch.rpm
    state: present

- name: Install the 'Development tools' package group
  ansible.builtin.yum:
    name: "@Development tools"
    state: present

- name: Install the 'Gnome desktop' environment group
  ansible.builtin.yum:
    name: "@^gnome-desktop-environment"
    state: present

- name: List ansible packages and register result to print with debug later
  ansible.builtin.yum:
    list: ansible
  register: result

- name: Install package with multiple repos enabled
  ansible.builtin.yum:
    name: sos
    enablerepo: "epel,ol7_latest"

- name: Install package with multiple repos disabled
  ansible.builtin.yum:
    name: sos
    disablerepo: "epel,ol7_latest"

- name: Download the nginx package but do not install it
  ansible.builtin.yum:
    name:
      - nginx
    state: latest
    download_only: true

