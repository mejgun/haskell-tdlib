module TD.Query.ShareUsersWithBot
  (ShareUsersWithBot(..)
  , defaultShareUsersWithBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.KeyboardButtonSource as KeyboardButtonSource

-- | Shares users after pressing a keyboardButtonTypeRequestUsers button with the bot. Returns 'TD.Data.Ok.Ok'
data ShareUsersWithBot
  = ShareUsersWithBot
    { source          :: Maybe KeyboardButtonSource.KeyboardButtonSource -- ^ Source of the button
    , button_id       :: Maybe Int                                       -- ^ Identifier of the button
    , shared_user_ids :: Maybe [Int]                                     -- ^ Identifiers of the shared users
    , only_check      :: Maybe Bool                                      -- ^ Pass true to check that the users can be shared by the button instead of actually sharing them
    }
  deriving (Eq, Show)

instance I.ShortShow ShareUsersWithBot where
  shortShow
    ShareUsersWithBot
      { source          = source_
      , button_id       = button_id_
      , shared_user_ids = shared_user_ids_
      , only_check      = only_check_
      }
        = "ShareUsersWithBot"
          ++ I.cc
          [ "source"          `I.p` source_
          , "button_id"       `I.p` button_id_
          , "shared_user_ids" `I.p` shared_user_ids_
          , "only_check"      `I.p` only_check_
          ]

instance AT.ToJSON ShareUsersWithBot where
  toJSON
    ShareUsersWithBot
      { source          = source_
      , button_id       = button_id_
      , shared_user_ids = shared_user_ids_
      , only_check      = only_check_
      }
        = A.object
          [ "@type"           A..= AT.String "shareUsersWithBot"
          , "source"          A..= source_
          , "button_id"       A..= button_id_
          , "shared_user_ids" A..= shared_user_ids_
          , "only_check"      A..= only_check_
          ]

defaultShareUsersWithBot :: ShareUsersWithBot
defaultShareUsersWithBot =
  ShareUsersWithBot
    { source          = Nothing
    , button_id       = Nothing
    , shared_user_ids = Nothing
    , only_check      = Nothing
    }

