package core

type BluefinPayconexError struct {
	IsBluefinPayconexError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewBluefinPayconexError(code string, msg string, ctx *Context) *BluefinPayconexError {
	return &BluefinPayconexError{
		IsBluefinPayconexError: true,
		Sdk:              "BluefinPayconex",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *BluefinPayconexError) Error() string {
	return e.Msg
}
