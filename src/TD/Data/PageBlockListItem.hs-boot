module TD.Data.PageBlockListItem (PageBlockListItem) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data PageBlockListItem

instance Eq PageBlockListItem

instance Show PageBlockListItem

instance ShortShow PageBlockListItem

instance FromJSON PageBlockListItem

instance ToJSON PageBlockListItem
