require 'set'

module FA
  class Icon
    attr_accessor :name
    attr_accessor :scale
    attr_accessor :fixed_width
    alias_method :fixed_width?, :fixed_width
    attr_accessor :list_item
    alias_method :list_item?, :list_item
    attr_accessor :border
    alias_method :border?, :border
    attr_accessor :pull
    attr_accessor :invert
    alias_method :invert?, :invert
    attr_accessor :animation
    attr_accessor :rotation
    attr_accessor :stacking

    attr_accessor :misc_classes

    def initialize name, other_classes=[]
      self.name = name
      misc_classes = other_classes
    end

    # Icon scaling
    def lg; self.scale = 'fa-lg';      self; end
    def x2; self.scale = 'fa-2x';      self; end
    def x3; self.scale = 'fa-3x';      self; end
    def x4; self.scale = 'fa-4x';      self; end
    def x5; self.scale = 'fa-5x';      self; end

    # Force icons to be a fixed width
    def fw; self.fixed_width = true;   self; end

    # Add `fa-li` to use the icon as a list bullet
    def li; self.list_item = true;     self; end

    # Add a border around the icon
    def bordered; self.border = true;  self; end

    # Pull (float) the icon to one side
    def pull_left;  self.pull = 'fa-pull-left';  self; end
    def pull_right; self.pull = 'fa-pull-right'; self; end

    # Invert the icon styling
    def inverted; invert = true; self; end

    # Apply an animation the icon
    def spin;   self.animation = 'fa-spin';  self; end
    def pulse;  self.animation = 'fa-pulse'; self; end

    # Apply a static rotation to the icon
    def r90;    self.rotation = 'fa-rotate-90';        self; end
    def r180;   self.rotation = 'fa-rotate-180';       self; end
    def r270;   self.rotation = 'fa-rotate-270';       self; end
    def flip_h; self.rotation = 'fa-flip-horizontal';  self; end
    def flip_v; self.rotation = 'fa-flip-vertical';    self; end

    def stack_lower; self.stacking = 'fa-stack-2x';  self; end
    def stack_upper; self.stacking = 'fa-stack-1x';  self; end

    def with_classes classes
      self.misc_classes = classes
      self
    end

    def to_s
      classes =  ['fa', "fa-#{name}"]
      classes << scale        if scale
      classes << "fa-fw"      if fixed_width?
      classes << "fa-li"      if list_item?
      classes << "fa-border"  if border?
      classes << pull         if pull
      classes << "fa-invert"  if invert?
      classes << animation    if animation
      classes << rotation     if rotation
      classes << stacking     if stacking
      # classes += misc_classes

      "<i class='#{classes.join(' ')}'></i>"
    end
  end

  class IconStack
    attr_accessor :lower_icon
    attr_accessor :upper_icon
    attr_accessor :classes

    def initialize lower, upper
      self.lower_icon = classify(lower).stack_lower
      self.upper_icon = classify(upper).stack_upper
      self.classes = Set.new(['fa-stack'])
    end

    def classify new_icon
      case new_icon
      when String
        FA::Icon.new(new_icon)
      else
        new_icon
      end
    end

    def with_classes new_classes
      self.classes += new_classes
    end

    def to_s
      html_str = "<span class='#{classes.to_a.join(' ')}'>"
      html_str += lower_icon.to_s
      html_str += upper_icon.to_s
      html_str += "</span>"
      html_str
    end
  end
end


def fa icon_name
  FA::Icon.new(icon_name)
end

def fa_stack lower, upper
  FA::IconStack.new(lower, upper)
end

