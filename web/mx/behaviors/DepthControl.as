class mx.behaviors.DepthControl extends Object
{
    function DepthControl()
    {
        super();
    } // End of the function
    static function sendToBack(target)
    {
        for (var _loc2 = false; _loc2 == false; _loc2 = target == mx.behaviors.DepthControl.getInstanceAtLowest(target._parent))
        {
            mx.behaviors.DepthControl.sendBackward(target);
        } // end of for
    } // End of the function
    static function bringToFront(target)
    {
        for (var _loc2 = false; _loc2 == false; _loc2 = target == mx.behaviors.DepthControl.getInstanceAtHighest(target._parent))
        {
            mx.behaviors.DepthControl.bringForward(target);
        } // end of for
    } // End of the function
    static function sendBackward(target)
    {
        var _loc2 = mx.behaviors.DepthControl.trackDepths(target._parent);
        if (target != mx.behaviors.DepthControl.getInstanceAtLowest(target._parent))
        {
            target.swapDepths(mx.behaviors.DepthControl.getInstanceLowerThan(target));
        } // end if
    } // End of the function
    static function bringForward(target)
    {
        if (target != mx.behaviors.DepthControl.getInstanceAtHighest(target._parent))
        {
            target.swapDepths(mx.behaviors.DepthControl.getInstanceHigherThan(target));
        } // end if
    } // End of the function
    static function trackDepths(mcParent)
    {
        var _loc4 = [];
        for (var _loc5 in mcParent)
        {
            if (typeof(mcParent[_loc5]) == "movieclip")
            {
                _loc4.push({mc: mcParent[_loc5], depth: mcParent[_loc5].getDepth()});
            } // end if
        } // end of for...in
        _loc4.sort(mx.behaviors.DepthControl.orderFunc);
        return (_loc4);
    } // End of the function
    static function orderFunc(a, b)
    {
        var _loc2 = Number(a.depth);
        var _loc1 = Number(b.depth);
        if (_loc2 > _loc1)
        {
            return (-1);
        }
        else if (_loc1 > _loc2)
        {
            return (1);
        }
        else
        {
            return (0);
        } // end else if
    } // End of the function
    static function getInstanceAtLowest(targetParent)
    {
        var _loc1 = mx.behaviors.DepthControl.trackDepths(targetParent);
        return (_loc1[_loc1.length - 1].mc);
    } // End of the function
    static function getInstanceAtHighest(targetParent)
    {
        var _loc1 = mx.behaviors.DepthControl.trackDepths(targetParent);
        return (_loc1[0].mc);
    } // End of the function
    static function getInstanceLowerThan(target)
    {
        var _loc2 = mx.behaviors.DepthControl.trackDepths(target._parent);
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if (_loc2[_loc1].mc == target)
            {
                break;
            } // end if
        } // end of for
        return (_loc2[_loc1 + 1].mc);
    } // End of the function
    static function getInstanceHigherThan(target)
    {
        var _loc2 = mx.behaviors.DepthControl.trackDepths(target._parent);
        for (var _loc1 = 0; _loc1 < _loc2.length; ++_loc1)
        {
            if (_loc2[_loc1].mc == target)
            {
                break;
            } // end if
        } // end of for
        return (_loc2[_loc1 - 1].mc);
    } // End of the function
} // End of Class
