module TD.Data.CallProblem
  (CallProblem(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the exact type of problem with a call
data CallProblem
  = CallProblemEcho -- ^ The user heard their own voice
  | CallProblemNoise -- ^ The user heard background noise
  | CallProblemInterruptions -- ^ The other side kept disappearing
  | CallProblemDistortedSpeech -- ^ The speech was distorted
  | CallProblemSilentLocal -- ^ The user couldn't hear the other side
  | CallProblemSilentRemote -- ^ The other side couldn't hear the user
  | CallProblemDropped -- ^ The call ended unexpectedly
  | CallProblemDistortedVideo -- ^ The video was distorted
  | CallProblemPixelatedVideo -- ^ The video was pixelated
  deriving (Eq, Show)

instance I.ShortShow CallProblem where
  shortShow CallProblemEcho
      = "CallProblemEcho"
  shortShow CallProblemNoise
      = "CallProblemNoise"
  shortShow CallProblemInterruptions
      = "CallProblemInterruptions"
  shortShow CallProblemDistortedSpeech
      = "CallProblemDistortedSpeech"
  shortShow CallProblemSilentLocal
      = "CallProblemSilentLocal"
  shortShow CallProblemSilentRemote
      = "CallProblemSilentRemote"
  shortShow CallProblemDropped
      = "CallProblemDropped"
  shortShow CallProblemDistortedVideo
      = "CallProblemDistortedVideo"
  shortShow CallProblemPixelatedVideo
      = "CallProblemPixelatedVideo"

instance AT.FromJSON CallProblem where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callProblemEcho"            -> pure CallProblemEcho
      "callProblemNoise"           -> pure CallProblemNoise
      "callProblemInterruptions"   -> pure CallProblemInterruptions
      "callProblemDistortedSpeech" -> pure CallProblemDistortedSpeech
      "callProblemSilentLocal"     -> pure CallProblemSilentLocal
      "callProblemSilentRemote"    -> pure CallProblemSilentRemote
      "callProblemDropped"         -> pure CallProblemDropped
      "callProblemDistortedVideo"  -> pure CallProblemDistortedVideo
      "callProblemPixelatedVideo"  -> pure CallProblemPixelatedVideo
      _                            -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON CallProblem where
  toJSON CallProblemEcho
      = A.object
        [ "@type" A..= AT.String "callProblemEcho"
        ]
  toJSON CallProblemNoise
      = A.object
        [ "@type" A..= AT.String "callProblemNoise"
        ]
  toJSON CallProblemInterruptions
      = A.object
        [ "@type" A..= AT.String "callProblemInterruptions"
        ]
  toJSON CallProblemDistortedSpeech
      = A.object
        [ "@type" A..= AT.String "callProblemDistortedSpeech"
        ]
  toJSON CallProblemSilentLocal
      = A.object
        [ "@type" A..= AT.String "callProblemSilentLocal"
        ]
  toJSON CallProblemSilentRemote
      = A.object
        [ "@type" A..= AT.String "callProblemSilentRemote"
        ]
  toJSON CallProblemDropped
      = A.object
        [ "@type" A..= AT.String "callProblemDropped"
        ]
  toJSON CallProblemDistortedVideo
      = A.object
        [ "@type" A..= AT.String "callProblemDistortedVideo"
        ]
  toJSON CallProblemPixelatedVideo
      = A.object
        [ "@type" A..= AT.String "callProblemPixelatedVideo"
        ]

