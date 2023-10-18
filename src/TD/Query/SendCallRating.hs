module TD.Query.SendCallRating
  (SendCallRating(..)
  , defaultSendCallRating
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.CallProblem as CallProblem

-- | Sends a call rating. Returns 'TD.Data.Ok.Ok'
data SendCallRating
  = SendCallRating
    { call_id  :: Maybe Int                       -- ^ Call identifier
    , rating   :: Maybe Int                       -- ^ Call rating; 1-5
    , comment  :: Maybe T.Text                    -- ^ An optional user comment if the rating is less than 5
    , problems :: Maybe [CallProblem.CallProblem] -- ^ List of the exact types of problems with the call, specified by the user
    }
  deriving (Eq, Show)

instance I.ShortShow SendCallRating where
  shortShow
    SendCallRating
      { call_id  = call_id_
      , rating   = rating_
      , comment  = comment_
      , problems = problems_
      }
        = "SendCallRating"
          ++ I.cc
          [ "call_id"  `I.p` call_id_
          , "rating"   `I.p` rating_
          , "comment"  `I.p` comment_
          , "problems" `I.p` problems_
          ]

instance AT.ToJSON SendCallRating where
  toJSON
    SendCallRating
      { call_id  = call_id_
      , rating   = rating_
      , comment  = comment_
      , problems = problems_
      }
        = A.object
          [ "@type"    A..= AT.String "sendCallRating"
          , "call_id"  A..= call_id_
          , "rating"   A..= rating_
          , "comment"  A..= comment_
          , "problems" A..= problems_
          ]

defaultSendCallRating :: SendCallRating
defaultSendCallRating =
  SendCallRating
    { call_id  = Nothing
    , rating   = Nothing
    , comment  = Nothing
    , problems = Nothing
    }

