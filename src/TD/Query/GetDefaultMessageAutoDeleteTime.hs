module TD.Query.GetDefaultMessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
