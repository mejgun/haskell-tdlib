-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CallProblem where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CallProblem = 
 CallProblemEcho 
 | CallProblemNoise 
 | CallProblemInterruptions 
 | CallProblemDistortedSpeech 
 | CallProblemSilentLocal 
 | CallProblemSilentRemote 
 | CallProblemDropped -- deriving (Show)

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
-- callProblemEcho CallProblem 

-- callProblemNoise CallProblem 

-- callProblemInterruptions CallProblem 

-- callProblemDistortedSpeech CallProblem 

-- callProblemSilentLocal CallProblem 

-- callProblemSilentRemote CallProblem 

-- callProblemDropped CallProblem 

