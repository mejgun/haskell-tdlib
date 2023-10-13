module TD.Data.JsonValue (JsonValue) where

import Data.Aeson.Types (FromJSON, ToJSON)

data JsonValue

instance Eq JsonValue

instance Show JsonValue

instance FromJSON JsonValue

instance ToJSON JsonValue
