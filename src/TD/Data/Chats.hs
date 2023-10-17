module TD.Data.Chats
  (Chats(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Chats
  = Chats -- ^ Represents a list of chats
    { total_count :: Maybe Int   -- ^ Approximate total number of chats found
    , chat_ids    :: Maybe [Int] -- ^ List of chat identifiers
    }
  deriving (Eq, Show)

instance I.ShortShow Chats where
  shortShow Chats
    { total_count = total_count_
    , chat_ids    = chat_ids_
    }
      = "Chats"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "chat_ids"    `I.p` chat_ids_
        ]

instance AT.FromJSON Chats where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chats" -> parseChats v
      _       -> mempty
    
    where
      parseChats :: A.Value -> AT.Parser Chats
      parseChats = A.withObject "Chats" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        chat_ids_    <- o A..:?  "chat_ids"
        pure $ Chats
          { total_count = total_count_
          , chat_ids    = chat_ids_
          }
  parseJSON _ = mempty

