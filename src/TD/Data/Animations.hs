module TD.Data.Animations
  (Animations(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Animation as Animation

data Animations
  = Animations -- ^ Represents a list of animations
    { animations :: Maybe [Animation.Animation] -- ^ List of animations
    }
  deriving (Eq, Show)

instance I.ShortShow Animations where
  shortShow Animations
    { animations = animations_
    }
      = "Animations"
        ++ I.cc
        [ "animations" `I.p` animations_
        ]

instance AT.FromJSON Animations where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "animations" -> parseAnimations v
      _            -> mempty
    
    where
      parseAnimations :: A.Value -> AT.Parser Animations
      parseAnimations = A.withObject "Animations" $ \o -> do
        animations_ <- o A..:?  "animations"
        pure $ Animations
          { animations = animations_
          }
  parseJSON _ = mempty

