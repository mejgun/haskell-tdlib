{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.FoundMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Message as Message
import qualified Utils as U

data FoundMessages = -- | Contains a list of messages found by a search @total_count Approximate total number of messages found; -1 if unknown @messages List of messages @next_offset The offset for the next request. If empty, there are no more results
  FoundMessages
  { -- |
    next_offset :: Maybe String,
    -- |
    messages :: Maybe [Message.Message],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show FoundMessages where
  show
    FoundMessages
      { next_offset = next_offset,
        messages = messages,
        total_count = total_count
      } =
      "FoundMessages"
        ++ U.cc
          [ U.p "next_offset" next_offset,
            U.p "messages" messages,
            U.p "total_count" total_count
          ]

instance T.FromJSON FoundMessages where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundMessages" -> parseFoundMessages v
      _ -> fail ""
    where
      parseFoundMessages :: A.Value -> T.Parser FoundMessages
      parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        messages_ <- o A..:? "messages"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ FoundMessages {next_offset = next_offset_, messages = messages_, total_count = total_count_}
  parseJSON _ = fail ""

instance T.ToJSON FoundMessages where
  toJSON
    FoundMessages
      { next_offset = next_offset,
        messages = messages,
        total_count = total_count
      } =
      A.object
        [ "@type" A..= T.String "foundMessages",
          "next_offset" A..= next_offset,
          "messages" A..= messages,
          "total_count" A..= total_count
        ]
