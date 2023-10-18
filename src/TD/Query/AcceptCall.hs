module TD.Query.AcceptCall
  (AcceptCall(..)
  , defaultAcceptCall
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.CallProtocol as CallProtocol

-- | Accepts an incoming call. Returns 'TD.Data.Ok.Ok'
data AcceptCall
  = AcceptCall
    { call_id  :: Maybe Int                       -- ^ Call identifier
    , protocol :: Maybe CallProtocol.CallProtocol -- ^ The call protocols supported by the application
    }
  deriving (Eq, Show)

instance I.ShortShow AcceptCall where
  shortShow
    AcceptCall
      { call_id  = call_id_
      , protocol = protocol_
      }
        = "AcceptCall"
          ++ I.cc
          [ "call_id"  `I.p` call_id_
          , "protocol" `I.p` protocol_
          ]

instance AT.ToJSON AcceptCall where
  toJSON
    AcceptCall
      { call_id  = call_id_
      , protocol = protocol_
      }
        = A.object
          [ "@type"    A..= AT.String "acceptCall"
          , "call_id"  A..= call_id_
          , "protocol" A..= protocol_
          ]

defaultAcceptCall :: AcceptCall
defaultAcceptCall =
  AcceptCall
    { call_id  = Nothing
    , protocol = Nothing
    }

