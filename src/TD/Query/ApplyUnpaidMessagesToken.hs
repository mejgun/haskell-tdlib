module TD.Query.ApplyUnpaidMessagesToken
  (ApplyUnpaidMessagesToken(..)
  , defaultApplyUnpaidMessagesToken
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Allows the current user to send unpaid messages to the given user, which requires payment for incoming messages, using a token from an internal link of the type internalLinkTypePublicChat, internalLinkTypeUserPhoneNumber, or internalLinkTypeUserToken. The first message sent to the user will be preceded by a messageUnpaidMessagesAllowedByLink message. Repeated calls and calls for the current user have no effect. Returns 'TD.Data.Ok.Ok'
data ApplyUnpaidMessagesToken
  = ApplyUnpaidMessagesToken
    { user_id :: Maybe Int    -- ^ Identifier of the user
    , token   :: Maybe T.Text -- ^ Token from the link
    }
  deriving (Eq, Show)

instance I.ShortShow ApplyUnpaidMessagesToken where
  shortShow
    ApplyUnpaidMessagesToken
      { user_id = user_id_
      , token   = token_
      }
        = "ApplyUnpaidMessagesToken"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "token"   `I.p` token_
          ]

instance AT.ToJSON ApplyUnpaidMessagesToken where
  toJSON
    ApplyUnpaidMessagesToken
      { user_id = user_id_
      , token   = token_
      }
        = A.object
          [ "@type"   A..= AT.String "applyUnpaidMessagesToken"
          , "user_id" A..= user_id_
          , "token"   A..= token_
          ]

defaultApplyUnpaidMessagesToken :: ApplyUnpaidMessagesToken
defaultApplyUnpaidMessagesToken =
  ApplyUnpaidMessagesToken
    { user_id = Nothing
    , token   = Nothing
    }

