module TD.Query.HideContactCloseBirthdays
  (HideContactCloseBirthdays(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Hides the list of contacts that have close birthdays for 24 hours. Returns 'TD.Data.Ok.Ok'
data HideContactCloseBirthdays
  = HideContactCloseBirthdays
  deriving (Eq, Show)

instance I.ShortShow HideContactCloseBirthdays where
  shortShow
    HideContactCloseBirthdays
        = "HideContactCloseBirthdays"

instance AT.ToJSON HideContactCloseBirthdays where
  toJSON
    HideContactCloseBirthdays
        = A.object
          [ "@type" A..= AT.String "hideContactCloseBirthdays"
          ]

