module TD.Data.InputPageBlock (InputPageBlock) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InputPageBlock

instance Eq InputPageBlock

instance Show InputPageBlock

instance ShortShow InputPageBlock

instance FromJSON InputPageBlock

instance ToJSON InputPageBlock
