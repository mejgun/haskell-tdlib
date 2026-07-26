module TD.Data.RichMessageSource (RichMessageSource) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data RichMessageSource

instance Eq RichMessageSource

instance Show RichMessageSource

instance ShortShow RichMessageSource

instance FromJSON RichMessageSource

instance ToJSON RichMessageSource
