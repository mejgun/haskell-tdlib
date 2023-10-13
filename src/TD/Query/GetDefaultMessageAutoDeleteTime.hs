module TD.Query.GetDefaultMessageAutoDeleteTime(GetDefaultMessageAutoDeleteTime(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetDefaultMessageAutoDeleteTime -- ^ Returns default message auto-delete time setting for new chats
  = GetDefaultMessageAutoDeleteTime
  deriving (Eq)

instance Show GetDefaultMessageAutoDeleteTime where
  show
    GetDefaultMessageAutoDeleteTime
        = "GetDefaultMessageAutoDeleteTime"

instance AT.ToJSON GetDefaultMessageAutoDeleteTime where
  toJSON
    GetDefaultMessageAutoDeleteTime
        = A.object
          [ "@type" A..= AT.String "getDefaultMessageAutoDeleteTime"
          ]
