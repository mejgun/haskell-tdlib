module TD.Data.SponsoredChats
  (SponsoredChats(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SponsoredChat as SponsoredChat

data SponsoredChats
  = SponsoredChats -- ^ Contains a list of sponsored chats
    { chats :: Maybe [SponsoredChat.SponsoredChat] -- ^ List of sponsored chats
    }
  deriving (Eq, Show)

instance I.ShortShow SponsoredChats where
  shortShow SponsoredChats
    { chats = chats_
    }
      = "SponsoredChats"
        ++ I.cc
        [ "chats" `I.p` chats_
        ]

instance AT.FromJSON SponsoredChats where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sponsoredChats" -> parseSponsoredChats v
      _                -> mempty
    
    where
      parseSponsoredChats :: A.Value -> AT.Parser SponsoredChats
      parseSponsoredChats = A.withObject "SponsoredChats" $ \o -> do
        chats_ <- o A..:?  "chats"
        pure $ SponsoredChats
          { chats = chats_
          }
  parseJSON _ = mempty

