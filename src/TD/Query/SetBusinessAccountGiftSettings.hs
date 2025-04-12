module TD.Query.SetBusinessAccountGiftSettings
  (SetBusinessAccountGiftSettings(..)
  , defaultSetBusinessAccountGiftSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.GiftSettings as GiftSettings

-- | Changes settings for gift receiving of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessAccountGiftSettings
  = SetBusinessAccountGiftSettings
    { business_connection_id :: Maybe T.Text                    -- ^ Unique identifier of business connection
    , settings               :: Maybe GiftSettings.GiftSettings -- ^ The new settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAccountGiftSettings where
  shortShow
    SetBusinessAccountGiftSettings
      { business_connection_id = business_connection_id_
      , settings               = settings_
      }
        = "SetBusinessAccountGiftSettings"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "settings"               `I.p` settings_
          ]

instance AT.ToJSON SetBusinessAccountGiftSettings where
  toJSON
    SetBusinessAccountGiftSettings
      { business_connection_id = business_connection_id_
      , settings               = settings_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessAccountGiftSettings"
          , "business_connection_id" A..= business_connection_id_
          , "settings"               A..= settings_
          ]

defaultSetBusinessAccountGiftSettings :: SetBusinessAccountGiftSettings
defaultSetBusinessAccountGiftSettings =
  SetBusinessAccountGiftSettings
    { business_connection_id = Nothing
    , settings               = Nothing
    }

