module TD.Query.GetMessageLinkInfo
  (GetMessageLinkInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a public or private message link. Can be called for any internal link of the type internalLinkTypeMessage. Returns 'TD.Data.MessageLinkInfo.MessageLinkInfo'
data GetMessageLinkInfo
  = GetMessageLinkInfo
    { url :: Maybe T.Text -- ^ The message link
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageLinkInfo where
  shortShow
    GetMessageLinkInfo
      { url = url_
      }
        = "GetMessageLinkInfo"
          ++ I.cc
          [ "url" `I.p` url_
          ]

instance AT.ToJSON GetMessageLinkInfo where
  toJSON
    GetMessageLinkInfo
      { url = url_
      }
        = A.object
          [ "@type" A..= AT.String "getMessageLinkInfo"
          , "url"   A..= url_
          ]

