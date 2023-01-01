# Patching

This is role will patching both Debian and CentOS distributions as well as the kernel and return a report back and save the report on the host machine

## Requirements

This role only works against Debian and CentOS machines.
NO further requirements other than whats in [**Dependencies**](#dependencies) section

```
playbooks/
├── patching.yml
└── roles
    └── patching
        ├── defaults
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   ├── main.yml
        │   ├── pre_check.yml
        │   ├── update_ubuntu.yml
        │   └── post_check.yml
        └── vars
            └── main.yml
```

## Role Variables

| Variable Name              | Required | Description                                                                                | Default Value                                | Variable Type |
| -------------------------- | :------: | ------------------------------------------------------------------------------------------ | -------------------------------------------- | :-----------: |
| patch_display_patch_output |   yes    | Whether or not to display output results of patching procedure                             | True                                         |    boolean    |
| patch_reboot_message       |    no    | Message to pass to the reboot module when a reboot is required due to patching activities. | "Rebooting due to patching."                 |    string     |
| patch_pkgs                 |    no    | List of specific packages to patch. **Patches all packages by default.**                   | ["*"]                                        |     list      |
| patch_never_reboot         |    no    | To ensure a system never reboots if a reboot is required post patching, set to True        | False                                        |    boolean    |
| patch_never_restart_svc    |    no    | To ensure services never restart if required post patching, set to True                    | False                                        |    boolean    |
| local_dir                  |   yes    | Path to send log files                                                                     | '/home/ANSIBLE/sys-patching/{{ timestamp }}' |     PATH      |
| kernel_upgrade_debian      |   yes    | Wether to upgrade the kernel version for Debian                                            | False                                        |    boolean    |

## Dependencies

[ansible.windows.win_uri](https://docs.ansible.com/ansible/latest/collections/ansible/windows/win_uri_module.html#ansible-collections-ansible-windows-win-uri-module)

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:
`ansible-playbook playbooks/patching.yml -e "node=<inventory group>" -i <path for inventory>`

```yaml
---
- name: Play to start patching role
  hosts:
    '{{nodes}}'
    # --extra-vars on the playbook command when ran
  become: true
  roles:
    - role: patching
```

## License

BSD

## Author Information

```
Developed and designed by Richard Craddock at Alpine Cyber Solution in Pottstown for American Food and Vending.
```
