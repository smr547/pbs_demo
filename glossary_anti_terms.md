## Anti-terms

PBS is very configurable and each deployment introduces terms that may be unique to a particular environment. The downside is
that there is PBS documentation on the web which, while accurate for another deployment, can be confusing and misleading for Raijin 
users. Some terms to watch out for:

* ``VNode`` -- this is a nebulous term that has a very vague definition in the PBS manual. Until somebody can give a coherent 
definition of what a VNode means on Raijin it is best to avoid the term. 
* ``VNODENUM`` -- an environment variable automatically set by some PBS deployments. As far as the author can tell ``VNODENUM`` is
not defined within Raijin PBS jobs and documents that describe it''s use should be ignored. ``VNODENUM`` is not available to us.
* ``VTASKNUM`` -- see ``VNODENUM``
