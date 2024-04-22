module TD.Data.BusinessChatLinkInfo
  (BusinessChatLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data BusinessChatLinkInfo
  = BusinessChatLinkInfo -- ^ Contains information about a business chat link
    { chat_id :: Maybe Int                         -- ^ Identifier of the private chat that created the link
    , text    :: Maybe FormattedText.FormattedText -- ^ Message draft text that must be added to the input field
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessChatLinkInfo where
  shortShow BusinessChatLinkInfo
    { chat_id = chat_id_
    , text    = text_
    }
      = "BusinessChatLinkInfo"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        , "text"    `I.p` text_
        ]

instance AT.FromJSON BusinessChatLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessChatLinkInfo" -> parseBusinessChatLinkInfo v
      _                      -> mempty
    
    where
      parseBusinessChatLinkInfo :: A.Value -> AT.Parser BusinessChatLinkInfo
      parseBusinessChatLinkInfo = A.withObject "BusinessChatLinkInfo" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        text_    <- o A..:?  "text"
        pure $ BusinessChatLinkInfo
          { chat_id = chat_id_
          , text    = text_
          }
  parseJSON _ = mempty

