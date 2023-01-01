# Role Name

A brief description of the role goes here.

## Requirements

- Docker
- [Docker SDK for Python](https://docker-py.readthedocs.io/en/stable/)
  [community.docker collection](https://galaxy.ansible.com/community/docker?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW)

## Role Variables

| Variable Name | Required | Description                           | Default Value | Variable Type |
| ------------- | :------: | ------------------------------------- | ------------- | :-----------: |
| dependencies  |   yes    | packages or services hat are required | docker        |    string     |

## Dependencies

- Docker version 20.10.17, build 100c70180f or later
- ansible [core 2.14.1] or later

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Author Information

[Richard Craddock](richardcraddock.me) craddock9richard@gmail.com
