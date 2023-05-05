package cmd

import (
	"github.com/temphia/temphia/cmd/cli"
	"github.com/temphia/temphia/code/backend/app/registry"
	wasmer "github.com/temphia/wasmer_executor"
)

func init() {
	registry.SetExecutor("wasmer", wasmer.NewBuilder)
}

func Run() {
	cli.RunMain()
}
