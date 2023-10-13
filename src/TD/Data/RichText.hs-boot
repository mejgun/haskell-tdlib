module TD.Data.RichText (RichText) where

import Data.Aeson.Types (FromJSON, ToJSON)

data RichText

instance Eq RichText

instance Show RichText

instance FromJSON RichText

instance ToJSON RichText
