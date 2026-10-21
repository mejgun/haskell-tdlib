module TD.Data.ProfileShareThemeBackdrop
  (ProfileShareThemeBackdrop(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.UpgradedGiftBackdropColors as UpgradedGiftBackdropColors

data ProfileShareThemeBackdrop
  = ProfileShareThemeBackdrop -- ^ Describes a backdrop, which can be used as a background of a theme of the screen for sharing a link to a user or a chat
    { _id    :: Maybe Int                                                   -- ^ Unique identifier of the backdrop
    , name   :: Maybe T.Text                                                -- ^ Name of the backdrop
    , colors :: Maybe UpgradedGiftBackdropColors.UpgradedGiftBackdropColors -- ^ Colors of the backdrop
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileShareThemeBackdrop where
  shortShow ProfileShareThemeBackdrop
    { _id    = _id_
    , name   = name_
    , colors = colors_
    }
      = "ProfileShareThemeBackdrop"
        ++ I.cc
        [ "_id"    `I.p` _id_
        , "name"   `I.p` name_
        , "colors" `I.p` colors_
        ]

instance AT.FromJSON ProfileShareThemeBackdrop where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileShareThemeBackdrop" -> parseProfileShareThemeBackdrop v
      _                           -> mempty
    
    where
      parseProfileShareThemeBackdrop :: A.Value -> AT.Parser ProfileShareThemeBackdrop
      parseProfileShareThemeBackdrop = A.withObject "ProfileShareThemeBackdrop" $ \o -> do
        _id_    <- o A..:?  "id"
        name_   <- o A..:?  "name"
        colors_ <- o A..:?  "colors"
        pure $ ProfileShareThemeBackdrop
          { _id    = _id_
          , name   = name_
          , colors = colors_
          }
  parseJSON _ = mempty

