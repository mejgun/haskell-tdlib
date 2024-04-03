module TD.Data.SharedChat
  (SharedChat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Photo as Photo

data SharedChat
  = SharedChat -- ^ Contains information about a chat shared with a bot
    { chat_id  :: Maybe Int         -- ^ Chat identifier
    , title    :: Maybe T.Text      -- ^ Title of the chat; for bots only
    , username :: Maybe T.Text      -- ^ Username of the chat; for bots only
    , photo    :: Maybe Photo.Photo -- ^ Photo of the chat; for bots only; may be null
    }
  deriving (Eq, Show)

instance I.ShortShow SharedChat where
  shortShow SharedChat
    { chat_id  = chat_id_
    , title    = title_
    , username = username_
    , photo    = photo_
    }
      = "SharedChat"
        ++ I.cc
        [ "chat_id"  `I.p` chat_id_
        , "title"    `I.p` title_
        , "username" `I.p` username_
        , "photo"    `I.p` photo_
        ]

instance AT.FromJSON SharedChat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sharedChat" -> parseSharedChat v
      _            -> mempty
    
    where
      parseSharedChat :: A.Value -> AT.Parser SharedChat
      parseSharedChat = A.withObject "SharedChat" $ \o -> do
        chat_id_  <- o A..:?  "chat_id"
        title_    <- o A..:?  "title"
        username_ <- o A..:?  "username"
        photo_    <- o A..:?  "photo"
        pure $ SharedChat
          { chat_id  = chat_id_
          , title    = title_
          , username = username_
          , photo    = photo_
          }
  parseJSON _ = mempty

