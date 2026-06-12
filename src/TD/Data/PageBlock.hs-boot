module TD.Data.PageBlock (PageBlock) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data PageBlock

instance Eq PageBlock

instance Show PageBlock

instance ShortShow PageBlock

instance FromJSON PageBlock

instance ToJSON PageBlock
