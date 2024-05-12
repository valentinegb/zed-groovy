use zed_extension_api::{self as zed, register_extension, Extension, LanguageServerId, Worktree};

struct GroovyExtension;

impl Extension for GroovyExtension {
    fn new() -> Self
    where
        Self: Sized,
    {
        GroovyExtension
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        _worktree: &Worktree,
    ) -> zed::Result<zed::Command> {
        Ok(zed::Command {
            command: "".to_string(),
            args: Vec::new(),
            env: Vec::new(),
        })
    }
}

register_extension!(GroovyExtension);
