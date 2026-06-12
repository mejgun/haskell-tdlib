module TD.Data.RichText (RichText) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data RichText

instance Eq RichText

instance Show RichText

instance ShortShow RichText

instance FromJSON RichText

instance ToJSON RichText
