module TD.Query.GetSuitablePersonalChats
  (GetSuitablePersonalChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns a list of channel chats, which can be used as a personal chat. Returns 'TD.Data.Chats.Chats'
data GetSuitablePersonalChats
  = GetSuitablePersonalChats
  deriving (Eq, Show)

instance I.ShortShow GetSuitablePersonalChats where
  shortShow
    GetSuitablePersonalChats
        = "GetSuitablePersonalChats"

instance AT.ToJSON GetSuitablePersonalChats where
  toJSON
    GetSuitablePersonalChats
        = A.object
          [ "@type" A..= AT.String "getSuitablePersonalChats"
          ]

