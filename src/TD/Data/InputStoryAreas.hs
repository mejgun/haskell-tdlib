module TD.Data.InputStoryAreas
  ( InputStoryAreas(..)    
  , defaultInputStoryAreas 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputStoryArea as InputStoryArea

data InputStoryAreas
  = InputStoryAreas -- ^ Contains a list of story areas to be added
    { areas :: Maybe [InputStoryArea.InputStoryArea] -- ^ List of 0-10 input story areas
    }
  deriving (Eq, Show)

instance I.ShortShow InputStoryAreas where
  shortShow InputStoryAreas
    { areas = areas_
    }
      = "InputStoryAreas"
        ++ I.cc
        [ "areas" `I.p` areas_
        ]

instance AT.FromJSON InputStoryAreas where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputStoryAreas" -> parseInputStoryAreas v
      _                 -> mempty
    
    where
      parseInputStoryAreas :: A.Value -> AT.Parser InputStoryAreas
      parseInputStoryAreas = A.withObject "InputStoryAreas" $ \o -> do
        areas_ <- o A..:?  "areas"
        pure $ InputStoryAreas
          { areas = areas_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputStoryAreas where
  toJSON InputStoryAreas
    { areas = areas_
    }
      = A.object
        [ "@type" A..= AT.String "inputStoryAreas"
        , "areas" A..= areas_
        ]

defaultInputStoryAreas :: InputStoryAreas
defaultInputStoryAreas =
  InputStoryAreas
    { areas = Nothing
    }

