package view

import org.uqbar.arena.widgets.Container
import org.uqbar.arena.widgets.TextBox

class LabeledTextBox extends AbstractLabeledWidget {

	TextBox textBox

	new(Container container) {
		super(container)
	}

	override LabeledTextBox setWidth(int ancho) {
		textBox.width = ancho
		this

	}

	override createWidget(AbstractLabeledWidget widget) {
		textBox = new TextBox(this)
		textBox.alignLeft
		this
	}

	override bindValueToProperty(String property) {
		textBox.bindValueToProperty(property)

		this
	}

}
