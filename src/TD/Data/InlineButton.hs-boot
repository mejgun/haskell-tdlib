module TD.Data.InlineButton (InlineButton) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data InlineButton

instance Eq InlineButton

instance Show InlineButton

instance ShortShow InlineButton

instance FromJSON InlineButton

instance ToJSON InlineButton
