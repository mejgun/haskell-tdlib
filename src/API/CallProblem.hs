-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallProblem where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the exact type of a problem with a call
data CallProblem = 
 CallProblemEcho 
 | CallProblemNoise 
 | CallProblemInterruptions 
 | CallProblemDistortedSpeech 
 | CallProblemSilentLocal 
 | CallProblemSilentRemote 
 | CallProblemDropped deriving (Show, Eq)

instance T.ToJSON CallProblem where
 toJSON (CallProblemEcho {  }) =
  A.object [ "@type" A..= T.String "callProblemEcho" ]

 toJSON (CallProblemNoise {  }) =
  A.object [ "@type" A..= T.String "callProblemNoise" ]

 toJSON (CallProblemInterruptions {  }) =
  A.object [ "@type" A..= T.String "callProblemInterruptions" ]

 toJSON (CallProblemDistortedSpeech {  }) =
  A.object [ "@type" A..= T.String "callProblemDistortedSpeech" ]

 toJSON (CallProblemSilentLocal {  }) =
  A.object [ "@type" A..= T.String "callProblemSilentLocal" ]

 toJSON (CallProblemSilentRemote {  }) =
  A.object [ "@type" A..= T.String "callProblemSilentRemote" ]

 toJSON (CallProblemDropped {  }) =
  A.object [ "@type" A..= T.String "callProblemDropped" ]

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
   _ -> mempty
  where
   parseCallProblemEcho :: A.Value -> T.Parser CallProblem
   parseCallProblemEcho = A.withObject "CallProblemEcho" $ \o -> do
    return $ CallProblemEcho {  }

   parseCallProblemNoise :: A.Value -> T.Parser CallProblem
   parseCallProblemNoise = A.withObject "CallProblemNoise" $ \o -> do
    return $ CallProblemNoise {  }

   parseCallProblemInterruptions :: A.Value -> T.Parser CallProblem
   parseCallProblemInterruptions = A.withObject "CallProblemInterruptions" $ \o -> do
    return $ CallProblemInterruptions {  }

   parseCallProblemDistortedSpeech :: A.Value -> T.Parser CallProblem
   parseCallProblemDistortedSpeech = A.withObject "CallProblemDistortedSpeech" $ \o -> do
    return $ CallProblemDistortedSpeech {  }

   parseCallProblemSilentLocal :: A.Value -> T.Parser CallProblem
   parseCallProblemSilentLocal = A.withObject "CallProblemSilentLocal" $ \o -> do
    return $ CallProblemSilentLocal {  }

   parseCallProblemSilentRemote :: A.Value -> T.Parser CallProblem
   parseCallProblemSilentRemote = A.withObject "CallProblemSilentRemote" $ \o -> do
    return $ CallProblemSilentRemote {  }

   parseCallProblemDropped :: A.Value -> T.Parser CallProblem
   parseCallProblemDropped = A.withObject "CallProblemDropped" $ \o -> do
    return $ CallProblemDropped {  }