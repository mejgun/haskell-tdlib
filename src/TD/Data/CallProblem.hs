{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.CallProblem where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the exact type of a problem with a call
data CallProblem
  = -- | The user heard their own voice
    CallProblemEcho
  | -- | The user heard background noise
    CallProblemNoise
  | -- | The other side kept disappearing
    CallProblemInterruptions
  | -- | The speech was distorted
    CallProblemDistortedSpeech
  | -- | The user couldn't hear the other side
    CallProblemSilentLocal
  | -- | The other side couldn't hear the user
    CallProblemSilentRemote
  | -- | The call ended unexpectedly
    CallProblemDropped
  | -- | The video was distorted
    CallProblemDistortedVideo
  | -- | The video was pixelated
    CallProblemPixelatedVideo
  deriving (Eq)

instance Show CallProblem where
  show CallProblemEcho =
    "CallProblemEcho"
      ++ U.cc
        []
  show CallProblemNoise =
    "CallProblemNoise"
      ++ U.cc
        []
  show CallProblemInterruptions =
    "CallProblemInterruptions"
      ++ U.cc
        []
  show CallProblemDistortedSpeech =
    "CallProblemDistortedSpeech"
      ++ U.cc
        []
  show CallProblemSilentLocal =
    "CallProblemSilentLocal"
      ++ U.cc
        []
  show CallProblemSilentRemote =
    "CallProblemSilentRemote"
      ++ U.cc
        []
  show CallProblemDropped =
    "CallProblemDropped"
      ++ U.cc
        []
  show CallProblemDistortedVideo =
    "CallProblemDistortedVideo"
      ++ U.cc
        []
  show CallProblemPixelatedVideo =
    "CallProblemPixelatedVideo"
      ++ U.cc
        []

instance T.FromJSON CallProblem where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "callProblemEcho" -> parseCallProblemEcho v
      "callProblemNoise" -> parseCallProblemNoise v
      "callProblemInterruptions" -> parseCallProblemInterruptions v
      "callProblemDistortedSpeech" -> parseCallProblemDistortedSpeech v
      "callProblemSilentLocal" -> parseCallProblemSilentLocal v
      "callProblemSilentRemote" -> parseCallProblemSilentRemote v
      "callProblemDropped" -> parseCallProblemDropped v
      "callProblemDistortedVideo" -> parseCallProblemDistortedVideo v
      "callProblemPixelatedVideo" -> parseCallProblemPixelatedVideo v
      _ -> mempty
    where
      parseCallProblemEcho :: A.Value -> T.Parser CallProblem
      parseCallProblemEcho = A.withObject "CallProblemEcho" $ \_ -> return CallProblemEcho

      parseCallProblemNoise :: A.Value -> T.Parser CallProblem
      parseCallProblemNoise = A.withObject "CallProblemNoise" $ \_ -> return CallProblemNoise

      parseCallProblemInterruptions :: A.Value -> T.Parser CallProblem
      parseCallProblemInterruptions = A.withObject "CallProblemInterruptions" $ \_ -> return CallProblemInterruptions

      parseCallProblemDistortedSpeech :: A.Value -> T.Parser CallProblem
      parseCallProblemDistortedSpeech = A.withObject "CallProblemDistortedSpeech" $ \_ -> return CallProblemDistortedSpeech

      parseCallProblemSilentLocal :: A.Value -> T.Parser CallProblem
      parseCallProblemSilentLocal = A.withObject "CallProblemSilentLocal" $ \_ -> return CallProblemSilentLocal

      parseCallProblemSilentRemote :: A.Value -> T.Parser CallProblem
      parseCallProblemSilentRemote = A.withObject "CallProblemSilentRemote" $ \_ -> return CallProblemSilentRemote

      parseCallProblemDropped :: A.Value -> T.Parser CallProblem
      parseCallProblemDropped = A.withObject "CallProblemDropped" $ \_ -> return CallProblemDropped

      parseCallProblemDistortedVideo :: A.Value -> T.Parser CallProblem
      parseCallProblemDistortedVideo = A.withObject "CallProblemDistortedVideo" $ \_ -> return CallProblemDistortedVideo

      parseCallProblemPixelatedVideo :: A.Value -> T.Parser CallProblem
      parseCallProblemPixelatedVideo = A.withObject "CallProblemPixelatedVideo" $ \_ -> return CallProblemPixelatedVideo
  parseJSON _ = mempty

instance T.ToJSON CallProblem where
  toJSON CallProblemEcho =
    A.object
      [ "@type" A..= T.String "callProblemEcho"
      ]
  toJSON CallProblemNoise =
    A.object
      [ "@type" A..= T.String "callProblemNoise"
      ]
  toJSON CallProblemInterruptions =
    A.object
      [ "@type" A..= T.String "callProblemInterruptions"
      ]
  toJSON CallProblemDistortedSpeech =
    A.object
      [ "@type" A..= T.String "callProblemDistortedSpeech"
      ]
  toJSON CallProblemSilentLocal =
    A.object
      [ "@type" A..= T.String "callProblemSilentLocal"
      ]
  toJSON CallProblemSilentRemote =
    A.object
      [ "@type" A..= T.String "callProblemSilentRemote"
      ]
  toJSON CallProblemDropped =
    A.object
      [ "@type" A..= T.String "callProblemDropped"
      ]
  toJSON CallProblemDistortedVideo =
    A.object
      [ "@type" A..= T.String "callProblemDistortedVideo"
      ]
  toJSON CallProblemPixelatedVideo =
    A.object
      [ "@type" A..= T.String "callProblemPixelatedVideo"
      ]
