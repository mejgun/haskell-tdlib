module TD.Data.Audios
  (Audios(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Audio as Audio

data Audios
  = Audios -- ^ Contains a list of audio files
    { total_count :: Maybe Int           -- ^ Approximate total number of audio files found
    , audios      :: Maybe [Audio.Audio] -- ^ List of audio files
    }
  deriving (Eq, Show)

instance I.ShortShow Audios where
  shortShow Audios
    { total_count = total_count_
    , audios      = audios_
    }
      = "Audios"
        ++ I.cc
        [ "total_count" `I.p` total_count_
        , "audios"      `I.p` audios_
        ]

instance AT.FromJSON Audios where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "audios" -> parseAudios v
      _        -> mempty
    
    where
      parseAudios :: A.Value -> AT.Parser Audios
      parseAudios = A.withObject "Audios" $ \o -> do
        total_count_ <- o A..:?  "total_count"
        audios_      <- o A..:?  "audios"
        pure $ Audios
          { total_count = total_count_
          , audios      = audios_
          }
  parseJSON _ = mempty

