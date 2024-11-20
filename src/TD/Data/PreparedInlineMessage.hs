module TD.Data.PreparedInlineMessage
  (PreparedInlineMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InlineQueryResult as InlineQueryResult
import qualified TD.Data.TargetChatTypes as TargetChatTypes

data PreparedInlineMessage
  = PreparedInlineMessage -- ^ Represents a ready to send inline message. Use sendInlineQueryResultMessage to send the message
    { inline_query_id :: Maybe Int                                 -- ^ Unique identifier of the inline query to pass to sendInlineQueryResultMessage
    , result          :: Maybe InlineQueryResult.InlineQueryResult -- ^ Resulted inline message of the query
    , chat_types      :: Maybe TargetChatTypes.TargetChatTypes     -- ^ Types of the chats to which the message can be sent
    }
  deriving (Eq, Show)

instance I.ShortShow PreparedInlineMessage where
  shortShow PreparedInlineMessage
    { inline_query_id = inline_query_id_
    , result          = result_
    , chat_types      = chat_types_
    }
      = "PreparedInlineMessage"
        ++ I.cc
        [ "inline_query_id" `I.p` inline_query_id_
        , "result"          `I.p` result_
        , "chat_types"      `I.p` chat_types_
        ]

instance AT.FromJSON PreparedInlineMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "preparedInlineMessage" -> parsePreparedInlineMessage v
      _                       -> mempty
    
    where
      parsePreparedInlineMessage :: A.Value -> AT.Parser PreparedInlineMessage
      parsePreparedInlineMessage = A.withObject "PreparedInlineMessage" $ \o -> do
        inline_query_id_ <- fmap I.readInt64 <$> o A..:?  "inline_query_id"
        result_          <- o A..:?                       "result"
        chat_types_      <- o A..:?                       "chat_types"
        pure $ PreparedInlineMessage
          { inline_query_id = inline_query_id_
          , result          = result_
          , chat_types      = chat_types_
          }
  parseJSON _ = mempty

