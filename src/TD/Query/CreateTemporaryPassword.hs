module TD.Query.CreateTemporaryPassword
  (CreateTemporaryPassword(..)
  , defaultCreateTemporaryPassword
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Creates a new temporary password for processing payments. Returns 'TD.Data.TemporaryPasswordState.TemporaryPasswordState'
data CreateTemporaryPassword
  = CreateTemporaryPassword
    { password  :: Maybe T.Text -- ^ The 2-step verification password of the current user
    , valid_for :: Maybe Int    -- ^ Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
    }
  deriving (Eq, Show)

instance I.ShortShow CreateTemporaryPassword where
  shortShow
    CreateTemporaryPassword
      { password  = password_
      , valid_for = valid_for_
      }
        = "CreateTemporaryPassword"
          ++ I.cc
          [ "password"  `I.p` password_
          , "valid_for" `I.p` valid_for_
          ]

instance AT.ToJSON CreateTemporaryPassword where
  toJSON
    CreateTemporaryPassword
      { password  = password_
      , valid_for = valid_for_
      }
        = A.object
          [ "@type"     A..= AT.String "createTemporaryPassword"
          , "password"  A..= password_
          , "valid_for" A..= valid_for_
          ]

defaultCreateTemporaryPassword :: CreateTemporaryPassword
defaultCreateTemporaryPassword =
  CreateTemporaryPassword
    { password  = Nothing
    , valid_for = Nothing
    }

