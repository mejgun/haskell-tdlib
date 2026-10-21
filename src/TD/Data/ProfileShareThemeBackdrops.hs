module TD.Data.ProfileShareThemeBackdrops
  (ProfileShareThemeBackdrops(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProfileShareThemeBackdrop as ProfileShareThemeBackdrop

data ProfileShareThemeBackdrops
  = ProfileShareThemeBackdrops -- ^ Contains a list of backdrops, which can be used as a background of a theme of the screen for sharing a link to a user or a chat
    { backdrops :: Maybe [ProfileShareThemeBackdrop.ProfileShareThemeBackdrop] -- ^ The list of backdrops
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileShareThemeBackdrops where
  shortShow ProfileShareThemeBackdrops
    { backdrops = backdrops_
    }
      = "ProfileShareThemeBackdrops"
        ++ I.cc
        [ "backdrops" `I.p` backdrops_
        ]

instance AT.FromJSON ProfileShareThemeBackdrops where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileShareThemeBackdrops" -> parseProfileShareThemeBackdrops v
      _                            -> mempty
    
    where
      parseProfileShareThemeBackdrops :: A.Value -> AT.Parser ProfileShareThemeBackdrops
      parseProfileShareThemeBackdrops = A.withObject "ProfileShareThemeBackdrops" $ \o -> do
        backdrops_ <- o A..:?  "backdrops"
        pure $ ProfileShareThemeBackdrops
          { backdrops = backdrops_
          }
  parseJSON _ = mempty

