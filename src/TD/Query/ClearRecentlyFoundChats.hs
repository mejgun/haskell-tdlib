module TD.Query.ClearRecentlyFoundChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ClearRecentlyFoundChats -- ^ Clears the list of recently found chats
  = ClearRecentlyFoundChats
  deriving (Eq)

instance Show ClearRecentlyFoundChats where
  show
    ClearRecentlyFoundChats
        = "ClearRecentlyFoundChats"

instance AT.ToJSON ClearRecentlyFoundChats where
  toJSON
    ClearRecentlyFoundChats
        = A.object
          [ "@type" A..= AT.String "clearRecentlyFoundChats"
          ]
