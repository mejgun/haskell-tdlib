module TD.Data.JsonObjectMember where

import Data.Aeson.Types (FromJSON, ToJSON)

data JsonObjectMember

instance Eq JsonObjectMember

instance Show JsonObjectMember

instance FromJSON JsonObjectMember

instance ToJSON JsonObjectMember
