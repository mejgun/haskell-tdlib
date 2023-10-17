module TD.Data.JsonObjectMember (JsonObjectMember) where

import Data.Aeson.Types (FromJSON, ToJSON)
import TD.Lib.Internal (ShortShow)

data JsonObjectMember

instance Eq JsonObjectMember

instance Show JsonObjectMember

instance ShortShow JsonObjectMember

instance FromJSON JsonObjectMember

instance ToJSON JsonObjectMember
