{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Messages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Message as Message
import qualified Utils as U

data Messages = -- | Contains a list of messages @total_count Approximate total number of messages found @messages List of messages; messages may be null
  Messages
  { -- |
    messages :: Maybe [Message.Message],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show Messages where
  show
    Messages
      { messages = messages,
        total_count = total_count
      } =
      "Messages"
        ++ U.cc
          [ U.p "messages" messages,
            U.p "total_count" total_count
          ]

instance T.FromJSON Messages where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messages" -> parseMessages v
      _ -> fail ""
    where
      parseMessages :: A.Value -> T.Parser Messages
      parseMessages = A.withObject "Messages" $ \o -> do
        messages_ <- o A..:? "messages"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Messages {messages = messages_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON Messages where
  toJSON
    Messages
      { messages = messages,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "messages",
          "messages" A..= messages,
          "total_count" A..= total_count
        ]
