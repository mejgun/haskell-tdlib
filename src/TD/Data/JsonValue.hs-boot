module TD.Data.JsonValue (JsonValue) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data JsonValue

instance Eq JsonValue

instance Show JsonValue

instance ShortShow JsonValue

instance FromJSON JsonValue

instance ToJSON JsonValue
