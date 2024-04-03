module TD.Query.SetBusinessIntro
  (SetBusinessIntro(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBusinessIntro as InputBusinessIntro

-- | Changes the business intro of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessIntro
  = SetBusinessIntro
    { intro :: Maybe InputBusinessIntro.InputBusinessIntro -- ^ The new intro of the business; pass null to remove the intro
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessIntro where
  shortShow
    SetBusinessIntro
      { intro = intro_
      }
        = "SetBusinessIntro"
          ++ I.cc
          [ "intro" `I.p` intro_
          ]

instance AT.ToJSON SetBusinessIntro where
  toJSON
    SetBusinessIntro
      { intro = intro_
      }
        = A.object
          [ "@type" A..= AT.String "setBusinessIntro"
          , "intro" A..= intro_
          ]

