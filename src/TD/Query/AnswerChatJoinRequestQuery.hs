module TD.Query.AnswerChatJoinRequestQuery
  (AnswerChatJoinRequestQuery(..)
  , defaultAnswerChatJoinRequestQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatJoinRequestResult as ChatJoinRequestResult
import qualified Data.Text as T

-- | Sets the result of a chat join query; for bots only. Returns 'TD.Data.Ok.Ok'
data AnswerChatJoinRequestQuery
  = AnswerChatJoinRequestQuery
    { query_id :: Maybe Int                                         -- ^ Identifier of the query
    , result   :: Maybe ChatJoinRequestResult.ChatJoinRequestResult -- ^ The result
    , url      :: Maybe T.Text                                      -- ^ URL of the Web App to open
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerChatJoinRequestQuery where
  shortShow
    AnswerChatJoinRequestQuery
      { query_id = query_id_
      , result   = result_
      , url      = url_
      }
        = "AnswerChatJoinRequestQuery"
          ++ I.cc
          [ "query_id" `I.p` query_id_
          , "result"   `I.p` result_
          , "url"      `I.p` url_
          ]

instance AT.ToJSON AnswerChatJoinRequestQuery where
  toJSON
    AnswerChatJoinRequestQuery
      { query_id = query_id_
      , result   = result_
      , url      = url_
      }
        = A.object
          [ "@type"    A..= AT.String "answerChatJoinRequestQuery"
          , "query_id" A..= fmap I.writeInt64  query_id_
          , "result"   A..= result_
          , "url"      A..= url_
          ]

defaultAnswerChatJoinRequestQuery :: AnswerChatJoinRequestQuery
defaultAnswerChatJoinRequestQuery =
  AnswerChatJoinRequestQuery
    { query_id = Nothing
    , result   = Nothing
    , url      = Nothing
    }

