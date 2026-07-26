module TD.Data.InputPageBlockListItem (InputPageBlockListItem) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputPageBlockListItem

instance Eq InputPageBlockListItem

instance Show InputPageBlockListItem

instance ShortShow InputPageBlockListItem

instance FromJSON InputPageBlockListItem

instance ToJSON InputPageBlockListItem
