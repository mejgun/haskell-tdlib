{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Chats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data Chats = -- | Represents a list of chats @total_count Approximate total number of chats found @chat_ids List of chat identifiers
  Chats
  { -- |
    chat_ids :: Maybe [Int],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show Chats where
  show
    Chats
      { chat_ids = chat_ids,
        total_count = total_count
      } =
      "Chats"
        ++ U.cc
          [ U.p "chat_ids" chat_ids,
            U.p "total_count" total_count
          ]

instance T.FromJSON Chats where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chats" -> parseChats v
      _ -> fail ""
    where
      parseChats :: A.Value -> T.Parser Chats
      parseChats = A.withObject "Chats" $ \o -> do
        chat_ids_ <- o A..:? "chat_ids"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Chats {chat_ids = chat_ids_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON Chats where
  toJSON
    Chats
      { chat_ids = chat_ids,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "chats",
          "chat_ids" A..= chat_ids,
          "total_count" A..= total_count
        ]
