module TD.Data.ChatFolderName
  ( ChatFolderName(..)    
  , defaultChatFolderName 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

data ChatFolderName
  = ChatFolderName -- ^ Describes name of a chat folder
    { text                 :: Maybe FormattedText.FormattedText -- ^ The text of the chat folder name; 1-12 characters without line feeds. May contain only CustomEmoji entities
    , animate_custom_emoji :: Maybe Bool                        -- ^ True, if custom emoji in the name must be animated
    }
  deriving (Eq, Show)

instance I.ShortShow ChatFolderName where
  shortShow ChatFolderName
    { text                 = text_
    , animate_custom_emoji = animate_custom_emoji_
    }
      = "ChatFolderName"
        ++ I.cc
        [ "text"                 `I.p` text_
        , "animate_custom_emoji" `I.p` animate_custom_emoji_
        ]

instance AT.FromJSON ChatFolderName where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatFolderName" -> parseChatFolderName v
      _                -> mempty
    
    where
      parseChatFolderName :: A.Value -> AT.Parser ChatFolderName
      parseChatFolderName = A.withObject "ChatFolderName" $ \o -> do
        text_                 <- o A..:?  "text"
        animate_custom_emoji_ <- o A..:?  "animate_custom_emoji"
        pure $ ChatFolderName
          { text                 = text_
          , animate_custom_emoji = animate_custom_emoji_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatFolderName where
  toJSON ChatFolderName
    { text                 = text_
    , animate_custom_emoji = animate_custom_emoji_
    }
      = A.object
        [ "@type"                A..= AT.String "chatFolderName"
        , "text"                 A..= text_
        , "animate_custom_emoji" A..= animate_custom_emoji_
        ]

defaultChatFolderName :: ChatFolderName
defaultChatFolderName =
  ChatFolderName
    { text                 = Nothing
    , animate_custom_emoji = Nothing
    }

